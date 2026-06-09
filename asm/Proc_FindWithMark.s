	.syntax unified
	.section .text.Proc_FindWithMark, "ax", %progbits
@ Proc_FindWithMark @ JP 0x08002E44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Proc_FindWithMark
	.thumb_func
Proc_FindWithMark:
	push {lr}
	adds r3, r0, #0
	ldr r1, _08002E60 @ =0x02024E68
	movs r2, #0
_08002E4C:
	ldr r0, [r1]
	cmp r0, #0
	beq _08002E64
	adds r0, r1, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, r3
	bne _08002E64
	adds r0, r1, #0
	b _08002E6E
	.align 2, 0
_08002E60: .4byte 0x02024E68
_08002E64:
	adds r2, #1
	adds r1, #0x6c
	cmp r2, #0x3f
	ble _08002E4C
	movs r0, #0
_08002E6E:
	pop {r1}
	bx r1
	.align 2, 0

