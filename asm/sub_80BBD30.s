	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80BBD30, "ax", %progbits
@ sub_80BBD30 @ JP 0x080BBD30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BBD30
	.thumb_func
sub_80BBD30:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	asrs r4, r0, #2
	adds r0, #1
	str r0, [r5, #0x34]
	movs r1, #0x10
	subs r1, r1, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
	cmp r4, #8
	bne _080BBD5A
	adds r0, r5, #0
	bl sub_8002DE4
_080BBD5A:
	pop {r4, r5}
	pop {r0}
	bx r0

