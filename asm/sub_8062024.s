	.syntax unified
	.set AnimCreate, 0x08004E50 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8062024, "ax", %progbits
@ sub_8062024 @ JP 0x08062024 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8062024
	.thumb_func
sub_8062024:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _08062064 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062068 @ =0x08600B1C
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x1e
	strh r0, [r5, #0x2e]
	ldr r1, _0806206C @ =0x08600B34
	movs r0, #7
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r5, #0x44]
	movs r1, #0
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08062070
	cmp r0, #1
	beq _08062078
	b _08062084
	.align 2, 0
_08062064: .4byte 0x0201774C
_08062068: .4byte 0x08600B1C
_0806206C: .4byte 0x08600B34
_08062070:
	ldr r0, _08062074 @ =0x08689354
	b _0806207A
	.align 2, 0
_08062074: .4byte 0x08689354
_08062078:
	ldr r0, _080620A0 @ =0x08689380
_0806207A:
	movs r1, #0x78
	bl AnimCreate
	adds r1, r0, #0
	str r1, [r5, #0x60]
_08062084:
	movs r0, #0xa1
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r6, #2]
	strh r0, [r1, #2]
	ldrh r0, [r6, #2]
	strh r0, [r5, #0x32]
	ldrh r0, [r6, #4]
	strh r0, [r1, #4]
	ldrh r0, [r6, #4]
	strh r0, [r5, #0x3a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080620A0: .4byte 0x08689380

