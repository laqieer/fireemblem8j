	.syntax unified
	.set GameControl_FadeBgmVolume, 0x08009A28 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_8009A3C, "ax", %progbits
@ sub_8009A3C @ JP 0x08009A3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009A3C
	.thumb_func
sub_8009A3C:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r2, [r0]
	cmp r2, #1
	beq _08009A76
	cmp r2, #1
	bgt _08009A52
	cmp r2, #0
	beq _08009A66
	b _08009AAC
_08009A52:
	cmp r2, #2
	beq _08009A5C
	cmp r2, #3
	beq _08009AA4
	b _08009AAC
_08009A5C:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _08009AAC
_08009A66:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	adds r0, r4, #0
	bl GameControl_FadeBgmVolume
	b _08009AAC
_08009A76:
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r1, [r0]
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	beq _08009A8A
	cmp r1, #1
	beq _08009A94
	b _08009A9C
_08009A8A:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _08009A9C
_08009A94:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_08009A9C:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _08009AAC
_08009AA4:
	adds r0, r4, #0
	movs r1, #0x17
	bl Proc_Goto
_08009AAC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

