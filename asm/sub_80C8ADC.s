	.syntax unified
	.set PutWmMinimapSprites, 0x080C881C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C899C, 0x080C899C + 1
	.section .text.sub_80C8ADC, "ax", %progbits
@ sub_80C8ADC @ JP 0x080C8ADC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8ADC
	.thumb_func
sub_80C8ADC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080C8B10 @ =0x08AC2830
	ldr r0, [r4, #0x34]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl sub_80C899C
	adds r0, r4, #0
	bl PutWmMinimapSprites
	ldr r0, [r4, #0x34]
	adds r0, #1
	str r0, [r4, #0x34]
	cmp r0, #4
	bne _080C8B0A
	movs r0, #0
	str r0, [r4, #0x34]
	adds r0, r4, #0
	bl sub_8002DE4
_080C8B0A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8B10: .4byte 0x08AC2830

