	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80153A4, 0x080153A4 + 1
	.section .text.sub_809EEE4, "ax", %progbits
@ sub_809EEE4 @ JP 0x0809EEE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809EEE4
	.thumb_func
sub_809EEE4:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80153A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4, #0x40]
	cmp r1, r0
	bne _0809EEFC
	adds r0, r4, #0
	bl sub_8002DE4
_0809EEFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

