	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_8009C7C, "ax", %progbits
@ sub_8009C7C @ JP 0x08009C7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009C7C
	.thumb_func
sub_8009C7C:
	push {lr}
	adds r2, r0, #0
	ldr r0, _08009CA0 @ =0x0202BCEC
	adds r0, #0x4a
	ldrb r0, [r0]
	movs r1, #0xe
	ands r1, r0
	cmp r1, #4
	beq _08009C92
	cmp r1, #8
	bne _08009C9A
_08009C92:
	adds r0, r2, #0
	movs r1, #5
	bl Proc_Goto
_08009C9A:
	pop {r0}
	bx r0
	.align 2, 0
_08009CA0: .4byte 0x0202BCEC

