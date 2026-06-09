	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_8070F94, 0x08070F94 + 1
	.set sub_80710AC, 0x080710AC + 1
	.set sub_80710DC, 0x080710DC + 1
	.section .text.sub_8071218, "ax", %progbits
@ sub_8071218 @ JP 0x08071218 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071218
	.thumb_func
sub_8071218:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_8070F08
	adds r7, r0, #0
	ldr r0, _08071254 @ =0x08603BEC
	adds r1, r4, #0
	bl sub_8002BCC
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r2, _08071258 @ =0x08625014
	ldr r3, _0807125C @ =0x08624C8C
	adds r0, r5, #0
	movs r1, #1
	bl sub_8070F94
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08071260
	ldrh r0, [r5, #2]
	subs r0, #8
	b _08071264
	.align 2, 0
_08071254: .4byte 0x08603BEC
_08071258: .4byte 0x08625014
_0807125C: .4byte 0x08624C8C
_08071260:
	ldrh r0, [r5, #2]
	adds r0, #8
_08071264:
	strh r0, [r4, #2]
	ldrh r1, [r5, #4]
	adds r1, #8
	strh r1, [r4, #4]
	ldrh r0, [r7, #6]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	strh r0, [r4, #2]
	ldrh r0, [r7, #8]
	adds r1, r1, r0
	strh r1, [r4, #4]
	ldr r0, [r6, #0x5c]
	ldr r1, _08071290 @ =0x0862493C
	bl sub_80710DC
	ldr r0, [r6, #0x5c]
	ldr r1, _08071294 @ =0x08624340
	bl sub_80710AC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071290: .4byte 0x0862493C
_08071294: .4byte 0x08624340

