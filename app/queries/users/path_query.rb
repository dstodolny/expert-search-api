module Users
  class PathQuery
    attr_reader :user_id

    def initialize(params)
      @params = params
      @user_id = @params[:user_id]
      @destination_id = nil
      @path_ids = []
    end

    def query
      user_id = @params[:user_id]

      User.where(id: path_ids).order_by_ids(path_ids)
    end

    private

    def destination_id
      return @destination_id if @destination_id.present?

      query = "%#{@params[:q].downcase}%"

      @destination_id = User
        .joins('LEFT OUTER JOIN headers h ON h.user_id = users.id')
        .where('LOWER(content) LIKE ?', query).first.id
    end

    def path_ids
      return @path_ids if @path_ids.present?

      @path_ids = ActiveRecord::Base.connection.execute(path_ids_query).map do |e|
        e["path_ids"]
      end
    end

    def path_ids_query
      "WITH
       RECURSIVE search_path (path_ids, is_visited) AS (#{search_path}),
       friendships_union AS (#{friendships_union}),
       ids_array AS
       (
         SELECT path_ids FROM search_path
         WHERE
           path_ids[1] = #{user_id}
           AND path_ids[array_length(path_ids, 1)] = #{destination_id}
         LIMIT 1
       )

       SELECT path_ids[s] FROM
       (
         SELECT path_ids, generate_subscripts(path_ids, 1) AS s
         FROM ids_array
       ) p"
    end

    def friendships_union
      "SELECT
         f.user_id AS user_id,
         f.friend_id AS destination_user_id
       FROM friendships f

       UNION
       SELECT
         f.friend_id AS user_id,
         f.user_id AS destination_user_id
       FROM friendships f"
    end

    def search_path
      "SELECT
         ARRAY[user_id, destination_user_id],
         user_id = destination_user_id
       FROM friendships_union

       UNION ALL
       SELECT
         path_ids || f.destination_user_id,
         f.destination_user_id = ANY(s.path_ids)
       FROM
         friendships_union f,
         search_path s
       WHERE
         s.path_ids[array_length(path_ids, 1)] = f.user_id
         AND NOT s.is_visited"
    end
  end
end
