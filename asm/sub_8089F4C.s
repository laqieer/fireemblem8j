	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetMuScreenPosition, 0x0807BBF8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_8089F4C, "ax", %progbits
@ sub_8089F4C @ JP 0x08089F4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089F4C
	.thumb_func
sub_8089F4C:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	ldrb r0, [r5]
	adds r1, r0, #0
	movs r2, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
	ldr r4, _08089FAC @ =0x02003BFC
	ldr r0, [r4, #0x10]
	movs r1, #6
	ldrsh r2, [r4, r1]
	adds r2, #0x8a
	movs r1, #0x50
	bl SetMuScreenPosition
	ldr r1, [r6, #0x3c]
	ldr r2, [r6, #0x40]
	movs r0, #0
	ldrsh r3, [r5, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #2
	bl sub_8012E84
	strh r0, [r4, #6]
	ldrh r0, [r5]
	adds r0, #3
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08089FA2
	adds r0, r6, #0
	bl sub_8002DE4
_08089FA2:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089FAC: .4byte 0x02003BFC

