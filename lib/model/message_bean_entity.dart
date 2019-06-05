class MessageBeanEntity {
	int shownOffset;
	bool noWartchers;
	String message;
//	dynamic lastViewTime;
	List<MessageBeanArticle> articles;
	String status;

	MessageBeanEntity({this.shownOffset, this.noWartchers, this.message
//		,this.lastViewTime
		, this.articles, this.status});

	MessageBeanEntity.fromJson(Map<String, dynamic> json) {
		shownOffset = json['shown_offset'];
		noWartchers = json['no_wartchers'];
		message = json['message'];
//		lastViewTime = json['last_view_time'];
		if (json['articles'] != null) {
			articles = new List<MessageBeanArticle>();(json['articles'] as List).forEach((v) { articles.add(new MessageBeanArticle.fromJson(v)); });
		}
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['shown_offset'] = this.shownOffset;
		data['no_wartchers'] = this.noWartchers;
		data['message'] = this.message;
//		data['last_view_time'] = this.lastViewTime;
		if (this.articles != null) {
      data['articles'] =  this.articles.map((v) => v.toJson()).toList();
    }
		data['status'] = this.status;
		return data;
	}
}

class MessageBeanArticle {
	String userName;
	String channel;
	String createdAt;
	String title;
	String type;
	bool isWatched;
	double score;
	String categoryId;
	String views2;
	String nickname;
	String userUrl;
	int sourcetype;
	String id;
	String tag;
	int views;
	String summary;
	int shownTime;
	int downs;
	int isexpert;
	String avatar;
	String url;
	String strategyId;
	int ups;
	String category;
	String strategy;
	String desc;

	MessageBeanArticle({this.userName, this.channel, this.createdAt, this.title, this.type, this.isWatched, this.score, this.categoryId, this.views2, this.nickname, this.userUrl, this.sourcetype, this.id, this.tag, this.views, this.summary, this.shownTime, this.downs, this.isexpert, this.avatar, this.url, this.strategyId, this.ups, this.category, this.strategy, this.desc});

	MessageBeanArticle.fromJson(Map<String, dynamic> json) {
		userName = json['user_name'];
		channel = json['channel'];
		createdAt = json['created_at'];
		title = json['title'];
		type = json['type'];
		isWatched = json['is_watched'];
		score = json['score'];
		categoryId = json['category_id'];
		views2 = json['views2'];
		nickname = json['nickname'];
		userUrl = json['user_url'];
		sourcetype = json['sourcetype'];
		id = json['id'];
		tag = json['tag'];
		views = json['views'];
		summary = json['summary'];
		shownTime = json['shown_time'];
		downs = json['downs'];
		isexpert = json['isexpert'];
		avatar = json['avatar'];
		url = json['url'];
		strategyId = json['strategy_id'];
		ups = json['ups'];
		category = json['category'];
		strategy = json['strategy'];
		desc = json['desc'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['user_name'] = this.userName;
		data['channel'] = this.channel;
		data['created_at'] = this.createdAt;
		data['title'] = this.title;
		data['type'] = this.type;
		data['is_watched'] = this.isWatched;
		data['score'] = this.score;
		data['category_id'] = this.categoryId;
		data['views2'] = this.views2;
		data['nickname'] = this.nickname;
		data['user_url'] = this.userUrl;
		data['sourcetype'] = this.sourcetype;
		data['id'] = this.id;
		data['tag'] = this.tag;
		data['views'] = this.views;
		data['summary'] = this.summary;
		data['shown_time'] = this.shownTime;
		data['downs'] = this.downs;
		data['isexpert'] = this.isexpert;
		data['avatar'] = this.avatar;
		data['url'] = this.url;
		data['strategy_id'] = this.strategyId;
		data['ups'] = this.ups;
		data['category'] = this.category;
		data['strategy'] = this.strategy;
		data['desc'] = this.desc;
		return data;
	}
}
