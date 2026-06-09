	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_8076550, "ax", %progbits
@ sub_8076550 @ JP 0x08076550 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8076550
	.thumb_func
sub_8076550:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08076566
	adds r0, r5, #0
	bl sub_8002DE4
	b _08076598
_08076566:
	ldr r4, _080765A0 @ =0x02020134
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	str r0, [sp]
	movs r0, #4
	movs r2, #0
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
	ble _08076598
	adds r0, r5, #0
	bl sub_8002DE4
_08076598:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080765A0: .4byte 0x02020134

