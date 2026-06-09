	.syntax unified
	.section .text.sub_8084C8C, "ax", %progbits
@ sub_8084C8C @ JP 0x08084C8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8084C8C
	.thumb_func
sub_8084C8C:
	push {lr}
	ldr r0, _08084CA4 @ =0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08084CB0
	ldr r0, _08084CA8 @ =0x0203E758
	ldr r1, _08084CAC @ =0x0203E750
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08084CB6
	.align 2, 0
_08084CA4: .4byte 0x04000006
_08084CA8: .4byte 0x0203E758
_08084CAC: .4byte 0x0203E750
_08084CB0:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08084CB6:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08084CD8
	ldr r2, _08084CDC @ =0x04000014
	ldr r0, _08084CE0 @ =0x0203E758
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
_08084CD8:
	pop {r0}
	bx r0
	.align 2, 0
_08084CDC: .4byte 0x04000014
_08084CE0: .4byte 0x0203E758

