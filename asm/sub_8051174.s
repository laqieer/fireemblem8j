	.syntax unified
	.set sub_8074EF0, 0x08074EF0 + 1
	.section .text.sub_8051174, "ax", %progbits
@ sub_8051174 @ JP 0x08051174 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8051174
	.thumb_func
sub_8051174:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08051190 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bne _0805119C
	ldr r0, _08051194 @ =0x02000000
	ldr r0, [r0, #8]
	bl sub_8074EF0
	ldr r0, _08051198 @ =sub_80511B4
	b _080511A6
	.align 2, 0
_08051190: .4byte 0x0203E11C
_08051194: .4byte 0x02000000
_08051198: .4byte 0x080511B5  @ sub_80511B4
_0805119C:
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080511B0 @ =sub_80511E0
_080511A6:
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080511B0: .4byte 0x080511E1  @ sub_80511E0

