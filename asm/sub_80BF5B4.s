	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80BF5B4, "ax", %progbits
@ sub_80BF5B4 @ JP 0x080BF5B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BF5B4
	.thumb_func
sub_80BF5B4:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _080BF5E8 @ =0x08AC17B4
	movs r1, #0
	bl sub_8002BCC
	adds r2, r0, #0
	cmp r2, #0
	beq _080BF5EC
	str r4, [r2, #0x2c]
	str r5, [r2, #0x30]
	str r6, [r2, #0x34]
	movs r0, #0
	strh r0, [r2, #0x38]
	str r7, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x40
	strh r0, [r1]
	ldr r0, [sp, #0x14]
	str r0, [r2, #0x44]
	adds r0, r2, #0
	b _080BF5EE
	.align 2, 0
_080BF5E8: .4byte 0x08AC17B4
_080BF5EC:
	movs r0, #0
_080BF5EE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

