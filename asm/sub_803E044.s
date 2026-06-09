	.syntax unified
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_803E044, "ax", %progbits
@ sub_803E044 @ JP 0x0803E044 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803E044
	.thumb_func
sub_803E044:
	push {lr}
	ldr r2, _0803E058 @ =0x0203A568
	adds r0, r2, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _0803E05C
	movs r0, #0xa
	rsbs r0, r0, #0
	b _0803E098
	.align 2, 0
_0803E058: .4byte 0x0203A568
_0803E05C:
	adds r0, r2, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _0803E09C @ =0x0203A4E8
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	cmp r1, #0
	bge _0803E07E
	movs r1, #0
_0803E07E:
	adds r0, r1, #0
	movs r1, #0x64
	bl sub_80D6374
	adds r1, r0, #0
	ldr r0, _0803E0A0 @ =0x030017D0
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	muls r1, r0, r1
	cmp r1, #0x28
	ble _0803E096
	movs r1, #0x28
_0803E096:
	adds r0, r1, #0
_0803E098:
	pop {r1}
	bx r1
	.align 2, 0
_0803E09C: .4byte 0x0203A4E8
_0803E0A0: .4byte 0x030017D0

