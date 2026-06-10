	.syntax unified
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8008E10, 0x08008E10 + 1
	.section .text.sub_8007C34, "ax", %progbits
@ sub_8007C34 @ JP 0x08007C34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8007C34
	.thumb_func
sub_8007C34:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08007C7C @ =0x085B90D4
	ldr r2, [r4]
	ldrb r0, [r2, #0xd]
	adds r0, #4
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08007C80 @ =0x02022CA8
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	ldrb r2, [r2, #0xa]
	lsls r2, r2, #1
	movs r3, #0
	bl j_TmFillRect
	movs r0, #1
	bl sub_8008E10
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0
	strh r0, [r1]
	ldr r1, [r4]
	ldrb r0, [r1, #9]
	cmp r0, #0
	bne _08007C84
	adds r1, r5, #0
	adds r1, #0x66
	movs r0, #0x10
	strh r0, [r1]
	b _08007C9A
	.align 2, 0
_08007C7C: .4byte 0x085B90D4
_08007C80: .4byte 0x02022CA8
_08007C84:
	ldrb r0, [r1, #9]
	adds r0, #1
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	blt _08007C92
	lsls r1, r1, #4
	b _08007C94
_08007C92:
	lsls r1, r0, #4
_08007C94:
	adds r0, r5, #0
	adds r0, #0x66
	strh r1, [r0]
_08007C9A:
	pop {r4, r5}
	pop {r0}
	bx r0

