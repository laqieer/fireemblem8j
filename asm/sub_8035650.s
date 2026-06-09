	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_8035650, "ax", %progbits
@ sub_8035650 @ JP 0x08035650 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035650
	.thumb_func
sub_8035650:
	push {r4, lr}
	adds r2, r0, #0
	adds r2, #0x58
	movs r1, #0
	strh r1, [r2]
	adds r0, #0x5a
	movs r1, #6
	strh r1, [r0]
	ldr r0, _080356B4 @ =0x08A96188
	ldr r1, _080356B8 @ =0x06015000
	bl sub_8013008
	ldr r0, _080356BC @ =0x08A9643C
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080356C0 @ =0x085C6668
	movs r1, #3
	bl sub_8002BCC
	ldr r4, _080356C4 @ =0x0202BCEC
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08035690
	movs r0, #0x6a
	bl m4aSongNumStart
_08035690:
	adds r3, r4, #0
	adds r3, #0x42
	ldrb r2, [r3]
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1f
	movs r1, #1
	subs r1, r1, r0
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080356B4: .4byte 0x08A96188
_080356B8: .4byte 0x06015000
_080356BC: .4byte 0x08A9643C
_080356C0: .4byte 0x085C6668
_080356C4: .4byte 0x0202BCEC

