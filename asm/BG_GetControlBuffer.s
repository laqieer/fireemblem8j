	.syntax unified
	.section .text.BG_GetControlBuffer, "ax", %progbits
@ BG_GetControlBuffer @ JP 0x08000EF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BG_GetControlBuffer
	.thumb_func
BG_GetControlBuffer:
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, r1, #0
	cmp r1, #1
	beq _08000F20
	cmp r1, #1
	bgt _08000F0C
	cmp r1, #0
	beq _08000F16
	b _08000F32
_08000F0C:
	cmp r2, #2
	beq _08000F28
	cmp r2, #3
	beq _08000F30
	b _08000F32
_08000F16:
	ldr r0, _08000F1C @ =0x0300302C
	b _08000F32
	.align 2, 0
_08000F1C: .4byte 0x0300302C
_08000F20:
	ldr r0, _08000F24 @ =0x03003030
	b _08000F32
	.align 2, 0
_08000F24: .4byte 0x03003030
_08000F28:
	ldr r0, _08000F2C @ =0x03003034
	b _08000F32
	.align 2, 0
_08000F2C: .4byte 0x03003034
_08000F30:
	ldr r0, _08000F38 @ =0x03003038
_08000F32:
	pop {r1}
	bx r1
	.align 2, 0
_08000F38: .4byte 0x03003038

