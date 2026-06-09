	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8075DF8, 0x08075DF8 + 1
	.set sub_8075E30, 0x08075E30 + 1
	.section .text.sub_80764C8, "ax", %progbits
@ sub_80764C8 @ JP 0x080764C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80764C8
	.thumb_func
sub_80764C8:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _080764DE
	adds r0, r5, #0
	bl sub_8002DE4
	b _08076534
_080764DE:
	ldr r4, _0807653C @ =0x02020134
	movs r2, #0x80
	lsls r2, r2, #5
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	bl sub_8012E84
	strh r0, [r4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	cmp r0, r1
	ble _08076534
	ldr r1, _08076540 @ =0x02020108
	ldr r0, _08076544 @ =0x0202010C
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r5, #0
	bl sub_8075DF8
	ldr r1, _08076548 @ =0x02020110
	ldr r0, _0807654C @ =0x02020112
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r5, #0
	bl sub_8075E30
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #8
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl sub_8002DE4
_08076534:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807653C: .4byte 0x02020134
_08076540: .4byte 0x02020108
_08076544: .4byte 0x0202010C
_08076548: .4byte 0x02020110
_0807654C: .4byte 0x02020112

