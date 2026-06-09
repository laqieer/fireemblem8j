	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_807FB70, "ax", %progbits
@ sub_807FB70 @ JP 0x0807FB70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807FB70
	.thumb_func
sub_807FB70:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	lsls r4, r3, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0807FBA0 @ =0x08A1422C
	movs r1, #3
	bl sub_8002BCC
	str r5, [r0, #0x2c]
	str r6, [r0, #0x50]
	mov r1, r8
	str r1, [r0, #0x54]
	adds r0, #0x58
	strh r4, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807FBA0: .4byte 0x08A1422C

