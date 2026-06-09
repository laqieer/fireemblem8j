	.syntax unified
	.set NewEkrNamewinAppear, 0x08057D98 + 1
	.set sub_8074D78, 0x08074D78 + 1
	.section .text.sub_8051ADC, "ax", %progbits
@ sub_8051ADC @ JP 0x08051ADC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8051ADC
	.thumb_func
sub_8051ADC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08051B08 @ =0x02017724
	movs r0, #1
	str r0, [r1]
	ldr r0, _08051B0C @ =0x0203E0F8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08051AFE
	movs r0, #2
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	bl sub_8074D78
_08051AFE:
	ldr r0, _08051B10 @ =nullsub_52
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051B08: .4byte 0x02017724
_08051B0C: .4byte 0x0203E0F8
_08051B10: .4byte 0x08051B15  @ nullsub_52

