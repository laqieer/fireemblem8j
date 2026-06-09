	.syntax unified
	.set sub_808895C, 0x0808895C + 1
	.section .text.sub_8088A6C, "ax", %progbits
@ sub_8088A6C @ JP 0x08088A6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8088A6C
	.thumb_func
sub_8088A6C:
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r5, _08088B00 @ =0x08A71538
	ldr r6, _08088B04 @ =0x03001CB8
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r4, #0xe
	str r4, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #2
	bl sub_808895C
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r1, r5, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	str r4, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #1
	movs r2, #0
	movs r3, #3
	bl sub_808895C
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r1, r5, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	str r4, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #2
	movs r2, #0
	movs r3, #4
	bl sub_808895C
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r1, r5, #3
	adds r0, r0, r1
	ldrb r1, [r0]
	str r4, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #3
	movs r2, #0
	movs r3, #5
	bl sub_808895C
	ldr r0, _08088B08 @ =0x03001CE0
	adds r0, #0x50
	movs r1, #0
	strb r1, [r0]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _08088AF8
	strb r0, [r6]
_08088AF8:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088B00: .4byte 0x08A71538
_08088B04: .4byte 0x03001CB8
_08088B08: .4byte 0x03001CE0

