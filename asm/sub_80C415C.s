	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C415C, "ax", %progbits
@ sub_80C415C @ JP 0x080C415C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C415C
	.thumb_func
sub_80C415C:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080C41A4 @ =0x08AC1EEC
	bl sub_8002BCC
	adds r3, r0, #0
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _080C417A
	movs r5, #0xc
	ldrsh r0, [r4, r5]
	ldr r2, _080C41A8 @ =0x03005270
	cmp r0, #0
	bge _080C4186
_080C417A:
	ldr r0, _080C41A8 @ =0x03005270
	ldrh r1, [r0, #2]
	strh r1, [r4, #0xa]
	ldrh r1, [r0, #4]
	strh r1, [r4, #0xc]
	adds r2, r0, #0
_080C4186:
	ldrh r1, [r4, #0xa]
	strh r1, [r3, #0x36]
	ldrh r0, [r4, #0xc]
	strh r0, [r3, #0x38]
	strh r1, [r2, #2]
	ldrh r0, [r3, #0x38]
	strh r0, [r2, #4]
	ldrh r2, [r4, #0xe]
	movs r5, #0xe
	ldrsh r0, [r4, r5]
	cmp r0, #0
	bge _080C41AC
	strh r1, [r3, #0x3a]
	b _080C41AE
	.align 2, 0
_080C41A4: .4byte 0x08AC1EEC
_080C41A8: .4byte 0x03005270
_080C41AC:
	strh r2, [r3, #0x3a]
_080C41AE:
	ldrh r0, [r4, #0x10]
	strh r0, [r3, #0x3c]
	ldrh r0, [r4, #8]
	strh r0, [r3, #0x34]
	ldr r0, [r4, #0x14]
	lsls r0, r0, #0xc
	str r0, [r3, #0x40]
	ldrh r1, [r4, #0x18]
	adds r0, r3, #0
	adds r0, #0x48
	strh r1, [r0]
	ldr r2, [r4]
	str r2, [r3, #0x2c]
	cmp r2, #0
	beq _080C41D8
	ldr r0, [r4, #4]
	ldr r1, [r2]
	bics r1, r0
	str r1, [r2]
	ldr r0, [r4, #4]
	str r0, [r3, #0x30]
_080C41D8:
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1

