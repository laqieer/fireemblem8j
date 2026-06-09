	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80720DC, 0x080720DC + 1
	.section .text.sub_8078A60, "ax", %progbits
@ sub_8078A60 @ JP 0x08078A60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078A60
	.thumb_func
sub_8078A60:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r1, #0x20
	rsbs r1, r1, #0
	movs r0, #0x2e
	ldrsh r3, [r6, r0]
	movs r4, #0x78
	str r4, [sp]
	movs r0, #5
	movs r2, #0
	bl sub_8012E84
	adds r5, r0, #0
	movs r1, #0x50
	rsbs r1, r1, #0
	movs r2, #0x2e
	ldrsh r3, [r6, r2]
	str r4, [sp]
	movs r0, #5
	movs r2, #0
	bl sub_8012E84
	adds r1, r0, #0
	ldr r0, _08078AAC @ =0x0201FB0C
	ldr r0, [r0]
	adds r0, r0, r5
	bl sub_80720DC
	ldrh r1, [r6, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	cmp r0, #0x78
	bne _08078AB0
	adds r0, r6, #0
	bl sub_8002DE4
	b _08078AB4
	.align 2, 0
_08078AAC: .4byte 0x0201FB0C
_08078AB0:
	adds r0, r1, #1
	strh r0, [r6, #0x2e]
_08078AB4:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

