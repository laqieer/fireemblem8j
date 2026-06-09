	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8014CCC, 0x08014CCC + 1
	.set sub_80C7240, 0x080C7240 + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_80C6C48, "ax", %progbits
@ sub_80C6C48 @ JP 0x080C6C48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C6C48
	.thumb_func
sub_80C6C48:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldrh r0, [r7, #0x34]
	adds r0, #1
	strh r0, [r7, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x36
	ldrsh r1, [r7, r2]
	cmp r0, r1
	bge _080C6CB6
	movs r1, #0x34
	ldrsh r0, [r7, r1]
	movs r2, #0x36
	ldrsh r1, [r7, r2]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r2, r3, #0
	bl sub_8014CCC
	adds r5, r0, #0
	movs r6, #0x80
	lsls r6, r6, #5
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	movs r2, #0x2a
	ldrsh r1, [r7, r2]
	subs r0, r0, r1
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r6, #0
	bl sub_80D6378
	ldrh r4, [r7, #0x2a]
	adds r4, r4, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	movs r2, #0x2c
	ldrsh r1, [r7, r2]
	subs r0, r0, r1
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r6, #0
	bl sub_80D6378
	ldrh r1, [r7, #0x2c]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_80C7240
	b _080C6CC8
_080C6CB6:
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	movs r2, #0x30
	ldrsh r1, [r7, r2]
	bl sub_80C7240
	adds r0, r7, #0
	bl sub_8002DE4
_080C6CC8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

