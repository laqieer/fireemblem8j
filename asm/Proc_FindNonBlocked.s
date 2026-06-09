	.syntax unified
	.section .text.Proc_FindNonBlocked, "ax", %progbits
@ Proc_FindNonBlocked @ JP 0x08002E14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Proc_FindNonBlocked
	.thumb_func
Proc_FindNonBlocked:
	push {lr}
	adds r3, r0, #0
	ldr r1, _08002E30 @ =0x02024E68
	movs r2, #0
_08002E1C:
	ldr r0, [r1]
	cmp r0, r3
	bne _08002E34
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _08002E34
	adds r0, r1, #0
	b _08002E3E
	.align 2, 0
_08002E30: .4byte 0x02024E68
_08002E34:
	adds r2, #1
	adds r1, #0x6c
	cmp r2, #0x3f
	ble _08002E1C
	movs r0, #0
_08002E3E:
	pop {r1}
	bx r1
	.align 2, 0

