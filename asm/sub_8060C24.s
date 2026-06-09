	.syntax unified
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_8060C24, "ax", %progbits
@ sub_8060C24 @ JP 0x08060C24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8060C24
	.thumb_func
sub_8060C24:
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _08060C40 @ =0x02020044
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08060C44
	adds r1, #0xff
	movs r0, #0xfe
	bl sub_8074E80
	b _08060C4E
	.align 2, 0
_08060C40: .4byte 0x02020044
_08060C44:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xff
	bl sub_8074E80
_08060C4E:
	ldr r1, _08060C5C @ =0x02020044
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08060C5C: .4byte 0x02020044

