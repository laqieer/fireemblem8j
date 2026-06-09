	.syntax unified
	.set sub_8086918, 0x08086918 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_80857E8, "ax", %progbits
@ sub_80857E8 @ JP 0x080857E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80857E8
	.thumb_func
sub_80857E8:
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r7, r4, #0
	bl sub_80C1E74
	cmp r0, #2
	beq _0808582A
	ldr r0, _08085830 @ =0x0203A954
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	bne _0808582A
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8086918
	cmp r0, #0
	bne _08085834
	adds r0, r6, #0
	movs r1, #0
	bl sub_8086918
	cmp r0, #0
	bne _08085834
	movs r0, #0
	adds r1, r7, #0
	bl sub_8086918
	cmp r0, #0
	bne _08085834
_0808582A:
	movs r0, #0
	b _08085836
	.align 2, 0
_08085830: .4byte 0x0203A954
_08085834:
	movs r0, #1
_08085836:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

