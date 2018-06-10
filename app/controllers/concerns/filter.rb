module Filter

  def filtrate(scope, order_type, pagination_options = {})
    pagination_presence = pagination_options[:pagination]
    pagination_pages = pagination_options[:pages]
    @query = scope.ransack(params[:query])
    @query.sorts = order_type

    pagination_presence ? @query.result.page(params[:page]).per(pagination_pages) : @query.result
  end
end
