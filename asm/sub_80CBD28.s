	.syntax unified
	.set SetBlendTargetA, 0x08001E20 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80CBD28, "ax", %progbits
@ sub_80CBD28 @ JP 0x080CBD28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CBD28
	.thumb_func
sub_80CBD28:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r3, [r4, #0x2a]
	movs r0, #0x3e
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1f
	bl sub_8012E84
	adds r2, r0, #0
	lsls r0, r2, #0xa
	lsls r1, r2, #5
	orrs r0, r1
	orrs r2, r0
	ldr r1, _080CBD84 @ =0x020228A8
	adds r0, r1, #0
	adds r0, #0x1e
_080CBD4E:
	strh r2, [r0]
	subs r0, #2
	cmp r0, r1
	bge _080CBD4E
	bl sub_8001EE4
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x3e
	bne _080CBD90
	movs r0, #0
	strh r0, [r4, #0x2a]
	ldr r1, _080CBD88 @ =0x02022188
	ldr r0, _080CBD8C @ =0x00007FFF
	strh r0, [r1, #0xc]
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CBD94
	.align 2, 0
_080CBD84: .4byte 0x020228A8
_080CBD88: .4byte 0x02022188
_080CBD8C: .4byte 0x00007FFF
_080CBD90:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CBD94:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

