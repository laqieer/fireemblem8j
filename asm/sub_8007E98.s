	.syntax unified
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8008E10, 0x08008E10 + 1
	.section .text.sub_8007E98, "ax", %progbits
@ sub_8007E98 @ JP 0x08007E98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8007E98
	.thumb_func
sub_8007E98:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08007ED0 @ =0x085B90D4
	ldr r2, [r0]
	ldrb r0, [r2, #0xd]
	adds r0, #4
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08007ED4 @ =0x02022CA8
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	ldrb r2, [r2, #0xa]
	lsls r2, r2, #1
	movs r3, #0
	bl j_TmFillRect
	movs r0, #1
	bl sub_8008E10
	adds r4, #0x64
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007ED0: .4byte 0x085B90D4
_08007ED4: .4byte 0x02022CA8

