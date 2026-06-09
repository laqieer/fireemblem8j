	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80737A4, 0x080737A4 + 1
	.set sub_8073B80, 0x08073B80 + 1
	.set sub_8077EE8, 0x08077EE8 + 1
	.section .text.sub_8056078, "ax", %progbits
@ sub_8056078 @ JP 0x08056078 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056078
	.thumb_func
sub_8056078:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, _080560A4 @ =0x0203E0FA
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _080560A8
	movs r2, #0x2c
	ldrsh r3, [r5, r2]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #4
	bl sub_8012E84
	adds r4, r0, #0
	bl sub_8073B80
	b _080560D8
	.align 2, 0
_080560A4: .4byte 0x0203E0FA
_080560A8:
	movs r2, #0x2c
	ldrsh r3, [r5, r2]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_8012E84
	adds r4, r0, #0
	movs r2, #0
	ldrsh r0, [r6, r2]
	subs r0, #1
	bl sub_8077EE8
	ldr r0, _08056100 @ =0x020228A8
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl sub_80737A4
	bl sub_8001EE4
_080560D8:
	ldrh r1, [r5, #0x2c]
	adds r1, #1
	strh r1, [r5, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	adds r0, #1
	cmp r1, r0
	bne _080560F8
	ldr r1, _08056104 @ =0x02017778
	movs r0, #0
	str r0, [r1]
	adds r0, r5, #0
	bl sub_8002DE4
_080560F8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08056100: .4byte 0x020228A8
_08056104: .4byte 0x02017778

