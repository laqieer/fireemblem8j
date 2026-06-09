	.syntax unified
	.set sub_80D65BC, 0x080D65BC + 1
	.section .text.sub_8001C50, "ax", %progbits
@ sub_8001C50 @ JP 0x08001C50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8001C50
	.thumb_func
sub_8001C50:
	push {lr}
	ldr r0, _08001C70 @ =0x030030D4
	ldr r0, [r0]
	cmp r0, #0
	beq _08001C5E
	bl sub_80D65BC
_08001C5E:
	ldr r0, _08001C74 @ =0x030036E8
	ldr r0, [r0]
	cmp r0, #0
	beq _08001C6A
	bl sub_80D65BC
_08001C6A:
	pop {r0}
	bx r0
	.align 2, 0
_08001C70: .4byte 0x030030D4
_08001C74: .4byte 0x030036E8

