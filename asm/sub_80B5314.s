	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_80B5314, "ax", %progbits
@ sub_80B5314 @ JP 0x080B5314 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B5314
	.thumb_func
sub_80B5314:
	push {r4, r5, lr}
	ldr r0, _080B5364 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xa0
	bls _080B5326
	movs r5, #0
_080B5326:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _080B535E
	cmp r5, #0x63
	bhi _080B5348
	ldr r1, _080B5368 @ =0x04000050
	movs r0, #0xc8
	strh r0, [r1]
	ldr r4, _080B536C @ =0x04000054
	movs r0, #0x64
	subs r0, r0, r5
	lsls r0, r0, #4
	movs r1, #0x64
	bl __divsi3
	strh r0, [r4]
_080B5348:
	cmp r5, #0
	bne _080B5354
	ldr r0, _080B5370 @ =0x04000012
	ldr r1, _080B5374 @ =0x03003020
	ldrh r1, [r1, #0x1e]
	strh r1, [r0]
_080B5354:
	cmp r5, #0x78
	bne _080B535E
	ldr r1, _080B5370 @ =0x04000012
	movs r0, #4
	strh r0, [r1]
_080B535E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5364: .4byte 0x04000006
_080B5368: .4byte 0x04000050
_080B536C: .4byte 0x04000054
_080B5370: .4byte 0x04000012
_080B5374: .4byte 0x03003020

