	.syntax unified
	.section .text.CheckEkrLvupDone, "ax", %progbits
@ CheckEkrLvupDone @ JP 0x080759D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CheckEkrLvupDone
	.thumb_func
CheckEkrLvupDone:
	push {lr}
	ldr r0, _080759E8 @ =0x020200B4
	ldr r0, [r0]
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _080759EC
	movs r0, #0
	b _080759EE
	.align 2, 0
_080759E8: .4byte 0x020200B4
_080759EC:
	movs r0, #1
_080759EE:
	pop {r1}
	bx r1
	.align 2, 0

