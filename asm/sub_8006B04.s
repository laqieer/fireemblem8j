	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set CheckTalkFlag, 0x080069E0 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_801569C, 0x0801569C + 1
	.section .text.sub_8006B04, "ax", %progbits
@ sub_8006B04 @ JP 0x08006B04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006B04
	.thumb_func
sub_8006B04:
	push {lr}
	movs r0, #0x20
	bl CheckTalkFlag
	cmp r0, #0
	bne _08006B28
	bl sub_801569C
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_08006B28:
	ldr r0, _08006B34 @ =0x085B90D8
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_08006B34: .4byte 0x085B90D8

