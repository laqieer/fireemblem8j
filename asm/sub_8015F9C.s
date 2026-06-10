	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8015F9C, "ax", %progbits
@ sub_8015F9C @ JP 0x08015F9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8015F9C
	.thumb_func
sub_8015F9C:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08015FCC @ =0x085C29F0
	movs r1, #3
	bl sub_8002BCC
	ldr r2, _08015FD0 @ =0x0202BCAC
	ldrh r1, [r2, #0x14]
	lsls r1, r1, #4
	strh r1, [r0, #0x2c]
	ldrh r1, [r2, #0x16]
	lsls r1, r1, #4
	strh r1, [r0, #0x2e]
	lsls r4, r4, #4
	strh r4, [r0, #0x30]
	lsls r5, r5, #4
	strh r5, [r0, #0x32]
	str r6, [r0, #0x38]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015FCC: .4byte 0x085C29F0
_08015FD0: .4byte 0x0202BCAC

