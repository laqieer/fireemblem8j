	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80160EC, "ax", %progbits
@ sub_80160EC @ JP 0x080160EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80160EC
	.thumb_func
sub_80160EC:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	movs r4, #0x2c
	ldrsh r2, [r5, r4]
	ldr r3, [r5, #0x3c]
	movs r6, #0x3a
	ldrsh r0, [r5, r6]
	str r0, [sp]
	movs r0, #0
	bl sub_8012E84
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r5, r0]
	movs r6, #0x2e
	ldrsh r2, [r5, r6]
	ldr r3, [r5, #0x3c]
	movs r6, #0x3a
	ldrsh r0, [r5, r6]
	str r0, [sp]
	movs r0, #0
	bl sub_8012E84
	ldr r1, _08016144 @ =0x0202BCAC
	strh r4, [r1, #0xc]
	strh r0, [r1, #0xe]
	ldr r0, [r5, #0x3c]
	adds r0, #1
	str r0, [r5, #0x3c]
	movs r2, #0x3a
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt _0801613A
	adds r0, r5, #0
	bl Proc_End
_0801613A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08016144: .4byte 0x0202BCAC

