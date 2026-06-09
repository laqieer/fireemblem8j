	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8012BA4, "ax", %progbits
@ sub_8012BA4 @ JP 0x08012BA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8012BA4
	.thumb_func
sub_8012BA4:
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r0, _08012BD4 @ =0x085BA2FC
	movs r1, #3
	bl sub_8002BCC
	lsls r4, r4, #4
	ldr r2, _08012BD8 @ =0x0202BCAC
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r4, r4, r1
	adds r4, #8
	str r4, [r0, #0x30]
	lsls r5, r5, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r5, r5, r1
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012BD4: .4byte 0x085BA2FC
_08012BD8: .4byte 0x0202BCAC

