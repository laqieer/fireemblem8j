	.syntax unified
	.set sub_8031160, 0x08031160 + 1
	.set sub_80A8C0C, 0x080A8C0C + 1
	.set sub_80AB750, 0x080AB750 + 1
	.section .text.sub_8009C04, "ax", %progbits
@ sub_8009C04 @ JP 0x08009C04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009C04
	.thumb_func
sub_8009C04:
	push {lr}
	bl sub_80AB750
	bl sub_80A8C0C
	bl sub_8031160
	ldr r1, _08009C1C @ =0x0202BCEC
	movs r0, #0x7f
	strb r0, [r1, #0xe]
	pop {r0}
	bx r0
	.align 2, 0
_08009C1C: .4byte 0x0202BCEC

