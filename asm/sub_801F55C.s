	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8009608, 0x08009608 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8014B50, 0x08014B50 + 1
	.section .text.sub_801F55C, "ax", %progbits
@ sub_801F55C @ JP 0x0801F55C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801F55C
	.thumb_func
sub_801F55C:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0801F5BC @ =0x085CB9D0
	ldr r1, _0801F5C0 @ =0x06014800
	bl sub_8013008
	ldr r0, _0801F5C4 @ =0x085CBE64
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r4, [r5, #0x2c]
	lsls r4, r4, #4
	ldr r1, _0801F5C8 @ =0x0202BCAC
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	subs r0, #8
	subs r4, r4, r0
	ldr r2, [r5, #0x30]
	lsls r2, r2, #4
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	subs r0, #8
	subs r2, r2, r0
	movs r3, #0x99
	lsls r3, r3, #6
	ldr r0, _0801F5CC @ =0x085CBC50
	adds r5, #0x4a
	movs r6, #0
	ldrsh r1, [r5, r6]
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	adds r1, r4, #0
	bl sub_8009608
	adds r4, #8
	movs r0, #0xbb
	adds r1, r4, #0
	bl sub_8014B50
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F5BC: .4byte 0x085CB9D0
_0801F5C0: .4byte 0x06014800
_0801F5C4: .4byte 0x085CBE64
_0801F5C8: .4byte 0x0202BCAC
_0801F5CC: .4byte 0x085CBC50

