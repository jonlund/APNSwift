//===----------------------------------------------------------------------===//
//
// This source file is part of the APNSwift open source project
//
// Copyright (c) 2022 the APNSwift project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of APNSwift project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

public struct LiveActivityAlert: Encodable, Sendable {
	let title: String?
	let body: String?
	let sound: String?
	
	public init(title: String?, body: String?, sound: String?) {
		self.title = title
		self.body = body
		self.sound = sound
	}
}

struct APNSLiveActivityNotificationAPSStorage<ContentState: Encodable & Sendable>: Encodable {
    enum CodingKeys: String, CodingKey {
        case timestamp = "timestamp"
        case event = "event"
        case contentState = "content-state"
        case dismissalDate = "dismissal-date"
    }
	

    var timestamp: Int
    var event: String
    var contentState: ContentState
    var dismissalDate: Int?
	var alert: LiveActivityAlert?

    init(
        timestamp: Int,
        event: String,
        contentState: ContentState,
        dismissalDate: Int?,
		alert: LiveActivityAlert? = nil
    ) {
        self.timestamp = timestamp
        self.contentState = contentState
        self.dismissalDate = dismissalDate
        self.event = event
		self.alert = alert
    }
}
