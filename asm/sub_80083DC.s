	.syntax unified
	.set sub_8001BC0, 0x08001BC0 + 1
	.section .text.sub_80083DC, "ax", %progbits
@ sub_80083DC @ JP 0x080083DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80083DC
	.thumb_func
sub_80083DC:
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl sub_8001BC0
	adds r3, r0, #0
	cmp r6, #5
	bls _080083F0
	b _08008552
_080083F0:
	lsls r0, r6, #2
	ldr r1, _080083FC @ =_08008400
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080083FC: .4byte _08008400
_08008400: @ jump table
	.4byte _08008418 @ case 0
	.4byte _0800844C @ case 1
	.4byte _08008484 @ case 2
	.4byte _080084B8 @ case 3
	.4byte _080084F0 @ case 4
	.4byte _08008528 @ case 5
_08008418:
	lsls r0, r4, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _08008440 @ =0x00003014
	adds r1, r2, #0
	strh r1, [r0]
	ldr r2, _08008444 @ =0x00003414
	adds r1, r2, #0
	strh r1, [r0, #2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08008448 @ =0x00003416
	adds r1, r3, #0
	strh r1, [r0]
	adds r2, #1
	b _0800854E
	.align 2, 0
_08008440: .4byte 0x00003014
_08008444: .4byte 0x00003414
_08008448: .4byte 0x00003416
_0800844C:
	lsls r0, r4, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _08008474 @ =0x00003014
	adds r1, r2, #0
	strh r1, [r0]
	ldr r2, _08008478 @ =0x00003414
	adds r1, r2, #0
	strh r1, [r0, #2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _0800847C @ =0x00003015
	adds r1, r3, #0
	strh r1, [r0]
	ldr r2, _08008480 @ =0x00003016
	b _0800854E
	.align 2, 0
_08008474: .4byte 0x00003014
_08008478: .4byte 0x00003414
_0800847C: .4byte 0x00003015
_08008480: .4byte 0x00003016
_08008484:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _080084AC @ =0x00003418
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _080084B0 @ =0x00003419
	adds r1, r3, #0
	strh r1, [r0]
	subs r3, #2
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _080084B4 @ =0x00003C17
	b _0800854E
	.align 2, 0
_080084AC: .4byte 0x00003418
_080084B0: .4byte 0x00003419
_080084B4: .4byte 0x00003C17
_080084B8:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _080084E0 @ =0x00003017
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _080084E4 @ =0x00003817
	adds r1, r3, #0
	strh r1, [r0]
	ldr r3, _080084E8 @ =0x00003018
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _080084EC @ =0x00003019
	b _0800854E
	.align 2, 0
_080084E0: .4byte 0x00003017
_080084E4: .4byte 0x00003817
_080084E8: .4byte 0x00003018
_080084EC: .4byte 0x00003019
_080084F0:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _08008518 @ =0x00003C19
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _0800851C @ =0x00003C18
	adds r1, r3, #0
	strh r1, [r0]
	ldr r3, _08008520 @ =0x00003417
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _08008524 @ =0x00003C17
	b _0800854E
	.align 2, 0
_08008518: .4byte 0x00003C19
_0800851C: .4byte 0x00003C18
_08008520: .4byte 0x00003417
_08008524: .4byte 0x00003C17
_08008528:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _08008558 @ =0x00003017
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _0800855C @ =0x00003817
	adds r1, r3, #0
	strh r1, [r0]
	adds r3, #2
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _08008560 @ =0x00003818
_0800854E:
	adds r1, r2, #0
	strh r1, [r0, #2]
_08008552:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08008558: .4byte 0x00003017
_0800855C: .4byte 0x00003817
_08008560: .4byte 0x00003818

