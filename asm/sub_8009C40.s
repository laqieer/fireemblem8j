	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_8009C40, "ax", %progbits
@ sub_8009C40 @ JP 0x08009C40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009C40
	.thumb_func
sub_8009C40:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_807B4B8
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #2
	bgt _08009C5C
	cmp r0, #1
	bge _08009C74
	cmp r0, #0
	beq _08009C62
	b _08009C74
_08009C5C:
	cmp r0, #3
	beq _08009C6C
	b _08009C74
_08009C62:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _08009C74
_08009C6C:
	adds r0, r4, #0
	movs r1, #0xf
	bl Proc_Goto
_08009C74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

