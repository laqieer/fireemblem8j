	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8002EB4, 0x08002EB4 + 1
	.set sub_80123F4, 0x080123F4 + 1
	.set sub_80153A4, 0x080153A4 + 1
	.section .text.sub_8010C84, "ax", %progbits
@ sub_8010C84 @ JP 0x08010C84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8010C84
	.thumb_func
sub_8010C84:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl sub_80153A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _08010CAC
	bl sub_80123F4
	ldr r0, [r5, #0x58]
	movs r1, #6
	bl sub_8002EB4
	adds r0, r5, #0
	bl sub_8002DE4
_08010CAC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

