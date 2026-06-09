	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80B23F0, "ax", %progbits
@ sub_80B23F0 @ JP 0x080B23F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B23F0
	.thumb_func
sub_80B23F0:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r1, r2, #0
	ldr r0, _080B2428 @ =0x08A9DBB4
	bl sub_8002BCC
	adds r5, r0, #0
	ldr r0, _080B242C @ =0x085E34A4
	ldr r2, _080B2430 @ =0x06010000
	adds r1, r4, r2
	bl sub_8013008
	ldr r0, _080B2434 @ =0x020228C8
	adds r1, r6, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_8000D68
	lsls r4, r4, #0xf
	lsrs r4, r4, #0x14
	str r4, [r5, #0x5c]
	str r6, [r5, #0x60]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080B2428: .4byte 0x08A9DBB4
_080B242C: .4byte 0x085E34A4
_080B2430: .4byte 0x06010000
_080B2434: .4byte 0x020228C8

