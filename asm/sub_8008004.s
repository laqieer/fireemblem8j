	.syntax unified
	.set CheckTalkFlag, 0x080069E0 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8004504, 0x08004504 + 1
	.set sub_8004564, 0x08004564 + 1
	.section .text.sub_8008004, "ax", %progbits
@ sub_8008004 @ JP 0x08008004 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008004
	.thumb_func
sub_8008004:
	push {r4, lr}
	ldr r0, _0800802C @ =0x085B90D4
	ldr r1, [r0]
	ldrb r0, [r1, #9]
	subs r0, #1
	strb r0, [r1, #9]
	movs r0, #0x80
	bl CheckTalkFlag
	cmp r0, #0
	beq _08008034
	ldr r4, _08008030 @ =0x030000D0
	adds r0, r4, #0
	bl sub_8004564
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D90
	b _08008044
	.align 2, 0
_0800802C: .4byte 0x085B90D4
_08008030: .4byte 0x030000D0
_08008034:
	ldr r4, _08008054 @ =0x030000D0
	adds r0, r4, #0
	bl sub_8004504
	adds r0, r4, #0
	movs r1, #6
	bl sub_8003D90
_08008044:
	ldr r0, _08008054 @ =0x030000D0
	movs r1, #4
	bl sub_8003D84
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008054: .4byte 0x030000D0

