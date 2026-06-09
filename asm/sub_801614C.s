	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_801614C, "ax", %progbits
@ sub_801614C @ JP 0x0801614C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801614C
	.thumb_func
sub_801614C:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r4, #0
	beq _08016168
	ldr r0, _08016164 @ =0x085C2A00
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _08016170
	.align 2, 0
_08016164: .4byte 0x085C2A00
_08016168:
	ldr r0, _08016190 @ =0x085C2A00
	movs r1, #3
	bl sub_8002BCC
_08016170:
	adds r3, r0, #0
	ldr r1, _08016194 @ =0x0202BCAC
	ldrh r0, [r1, #0xc]
	movs r2, #0
	strh r0, [r3, #0x30]
	ldrh r0, [r1, #0xe]
	strh r0, [r3, #0x32]
	lsls r0, r5, #4
	strh r0, [r3, #0x2c]
	lsls r0, r6, #4
	strh r0, [r3, #0x2e]
	strh r7, [r3, #0x3a]
	str r2, [r3, #0x3c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016190: .4byte 0x085C2A00
_08016194: .4byte 0x0202BCAC

