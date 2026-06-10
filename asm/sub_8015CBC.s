	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_8015CBC, "ax", %progbits
@ sub_8015CBC @ JP 0x08015CBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8015CBC
	.thumb_func
sub_8015CBC:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r2, [r5, #0x3c]
	cmp r2, #0
	bne _08015CDC
	ldr r0, _08015CD8 @ =0x0202BCAC
	ldrh r1, [r0, #0xc]
	strh r1, [r5, #0x2c]
	ldrh r0, [r0, #0xe]
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_End
	b _08015D2C
	.align 2, 0
_08015CD8: .4byte 0x0202BCAC
_08015CDC:
	ldr r0, _08015D34 @ =0x0202BD40
	adds r0, r2, r0
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r5, #0x3a]
	subs r0, r0, r1
	strh r0, [r5, #0x3a]
	subs r0, r2, #1
	str r0, [r5, #0x3c]
	ldr r4, _08015D38 @ =0x0202BCAC
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	movs r2, #0x2c
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	movs r2, #0x3a
	ldrsh r1, [r5, r2]
	muls r0, r1, r0
	movs r2, #0x38
	ldrsh r1, [r5, r2]
	bl __divsi3
	ldrh r1, [r5, #0x2c]
	adds r1, r1, r0
	strh r1, [r4, #0xc]
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	movs r2, #0x3a
	ldrsh r1, [r5, r2]
	muls r0, r1, r0
	movs r2, #0x38
	ldrsh r1, [r5, r2]
	bl __divsi3
	ldrh r1, [r5, #0x2e]
	adds r1, r1, r0
	strh r1, [r4, #0xe]
_08015D2C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015D34: .4byte 0x0202BD40
_08015D38: .4byte 0x0202BCAC

