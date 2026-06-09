	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8019F48, 0x08019F48 + 1
	.set sub_80353E8, 0x080353E8 + 1
	.section .text.sub_803581C, "ax", %progbits
@ sub_803581C @ JP 0x0803581C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803581C
	.thumb_func
sub_803581C:
	push {lr}
	adds r1, r0, #0
	ldr r0, _08035840 @ =0x085C66D8
	bl Proc_StartBlocking
	movs r1, #0
	str r1, [r0, #0x2c]
	bl sub_80353E8
	bl sub_8019F48
	ldr r1, _08035844 @ =0x0202BCAC
	ldrh r0, [r1, #0x2a]
	adds r0, #0x10
	strh r0, [r1, #0x2a]
	pop {r0}
	bx r0
	.align 2, 0
_08035840: .4byte 0x085C66D8
_08035844: .4byte 0x0202BCAC

