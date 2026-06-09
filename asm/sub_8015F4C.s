	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8015AB4, 0x08015AB4 + 1
	.section .text.sub_8015F4C, "ax", %progbits
@ sub_8015F4C @ JP 0x08015F4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8015F4C
	.thumb_func
sub_8015F4C:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	movs r2, #0x30
	ldrsh r1, [r7, r2]
	subs r0, r0, r1
	ldr r4, [r7, #0x34]
	muls r0, r4, r0
	ldr r5, [r7, #0x38]
	adds r1, r5, #0
	bl __divsi3
	adds r6, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	subs r0, r0, r1
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0
	bl sub_8015AB4
	ldr r0, [r7, #0x34]
	subs r0, #1
	str r0, [r7, #0x34]
	cmp r0, #0
	bge _08015F94
	adds r0, r7, #0
	bl sub_8002DE4
_08015F94:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

