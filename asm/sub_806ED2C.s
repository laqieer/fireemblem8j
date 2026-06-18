	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_806ED5C, 0x0806ED5C + 1
	.set sub_806EDD4, 0x0806EDD4 + 1
	.section .text.sub_806ED2C, "ax", %progbits
@ efxPierceCriticalEffectMain @ JP 0x0806ED2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global efxPierceCriticalEffectMain
	.thumb_func
efxPierceCriticalEffectMain:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806ED4C
	ldr r0, [r4, #0x5c]
	bl sub_806ED5C
	ldr r0, [r4, #0x5c]
	bl sub_806EDD4
	b _0806ED56
_0806ED4C:
	cmp r0, #0x11
	bne _0806ED56
	adds r0, r4, #0
	bl sub_8002DE4
_0806ED56:
	pop {r4}
	pop {r0}
	bx r0

