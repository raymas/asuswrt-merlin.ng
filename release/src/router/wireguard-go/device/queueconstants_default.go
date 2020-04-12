// +build !android,!ios

/* SPDX-License-Identifier: MIT
 *
 * Copyright (C) 2017-2019 WireGuard LLC. All Rights Reserved.
 */

package device

const (
	QueueOutboundSize          = 1024
	QueueInboundSize           = 1024
	QueueHandshakeSize         = 1024
	MaxSegmentSize             = 2200             // largest possible UDP datagram
	PreallocatedBuffersPerPool = 4096             // Disable and allow for infinite memory growth
)
