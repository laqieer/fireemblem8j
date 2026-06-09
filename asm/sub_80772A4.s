	.syntax unified
	.set NewEkrsubAnimeEmulator, 0x08073BBC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8077048, 0x08077048 + 1
	.section .text.sub_80772A4, "ax", %progbits
@ sub_80772A4 @ JP 0x080772A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80772A4
	.thumb_func
sub_80772A4:
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bge _080772B8
	adds r0, r4, #0
	bl sub_8002DE4
	b _08077306
_080772B8:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _08077306
	strh r5, [r4, #0x2c]
	ldr r3, [r4, #0x48]
	lsls r3, r3, #0xc
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	orrs r3, r0
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	subs r0, #3
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	ldr r2, _08077310 @ =0x085F3558
	str r3, [sp]
	str r5, [sp, #4]
	movs r3, #3
	str r3, [sp, #8]
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x60]
	ldr r0, [r4, #0x50]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl sub_8077048
	adds r0, r4, #0
	bl sub_8002DE4
_08077306:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077310: .4byte 0x085F3558

